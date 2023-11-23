//
//  ContentView.swift
//  WonderImageGenerator
//
//  Created by Arsenii Dudyk on 15/11/23.
//


import SwiftUI

struct PromptView: View {
    
    @StateObject private var viewModel = ViewModel()
    @State var prompt: String = ""
    @State var generatedImage: UIImage?
    @State var isLoading: Bool = false
    @State var selectedStyle = ImageStyle.allCases[0]
    @State var promptText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack() {
                HStack {
                    Text("Wonder")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Button(action: {
                            
                        }) {
                            VStack {
                                Text("0")
                                    .foregroundColor(.white)
                                    .font(.caption2)
                                    .bold()
                                Text("credits")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                                    .bold()
                            }
                            .padding(.vertical, 3)
                            .padding(.horizontal, 15)
                            .background(Color.black)
                            .cornerRadius(10)
                        }
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "person.fill")
                                .foregroundColor(.black)
                                .font(.title)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.bottom, -1)
                
                TextField("Enter a prompt", text: $prompt, axis: .vertical)
                    .lineLimit(6...6)
                    .padding()
                    .font(.caption)
                    .background(Color.gray.opacity(0.1))
                    .tint(Color.pink)
                    .cornerRadius(5)
                
                HStack(spacing: 9) {
                    Button(action: {
                        
                    }) {
                        HStack{
                            Image(systemName: "lightbulb.fill")
                                .foregroundStyle(.yellow)
                            Text("Inspiration")
                                .bold()
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        
                    }
                    
                    
                    Button(action: {
                        
                    }) {
                        HStack{
                            Image(systemName: "photo")
                                .foregroundStyle(.purple)
                            Text("Add Your Photo")
                                .bold()
                                .font(.caption)
                                .foregroundColor(.black)
                            
                        }
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    
                    
                    Button(action: {
                        
                    }) {
                        HStack{
                            Image(systemName: "square")
                                .foregroundStyle(.black)
                            Text("1:1")
                                .bold()
                                .font(.caption)
                                .foregroundColor(.black)
                            Image(systemName: "chevron.down")
                                .foregroundStyle(.black)
                        }
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
                
                
                HStack() {
                    Text("Select")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(.top, 30)
                    Text("Style")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("See all")
                            .foregroundColor(.gray)
                            .bold()
                            .font(.caption)
                            .padding(.top, 30)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.caption)
                            .bold()
                            .padding(.top, 30)
                        
                    }
                }
                
                GeometryReader { reader in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: [GridItem(.fixed(reader.size.width * 0.5)), GridItem(.fixed(reader.size.width * 0.4))]) {
                            ForEach(ImageStyle.allCases, id: \.self) { imageStyle in
                                VStack(alignment: .leading) {
                                    Button {
                                        selectedStyle = imageStyle
                                    } label: {
                                        Image(imageStyle.rawValue)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: reader.size.width * 0.35, height: reader.size.width * 0.35)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 15).stroke(Color.cyan, lineWidth: imageStyle == selectedStyle ? 5 : 0)
                                            }
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                    }
                                    
                                    Text(imageStyle.title)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.black)
                                }
                                .accessibilityLabel(imageStyle.title)
                            }
                        }
                    }
                }
                .padding(.top, -20)
                
                
                HStack {
                    Spacer()
                    NavigationLink(destination: GeneratorView(viewModel: viewModel, prompt: $prompt), label: {
                        HStack{
                            Spacer()
                            Text("Create")
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                                .background(Color.gray)
                                .cornerRadius(5)
                                .frame(width: 300, height: 50)
                            Image(systemName: "arrow.forward")
                                .font(.title2)
                                .bold()
                        }
                    })
                    .tint(Color.gray)
                    .buttonStyle(.borderedProminent)
                    .onAppear {
                        viewModel.setup()
                    }
                    Spacer()
                }
                .padding()
            }
            .padding()
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

struct PromptView_Previews: PreviewProvider {
    static var previews: some View {
        PromptView()
    }
}
