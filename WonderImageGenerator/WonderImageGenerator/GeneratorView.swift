//
//  GeneratorView.swift
//  WonderImageGenerator
//
//  Created by Arsenii Dudyk on 15/11/23.
//

import SwiftUI

struct GeneratorView: View {
    
    @ObservedObject var viewModel: ViewModel
    @Binding var prompt: String
    @State var generatedImage: UIImage?
    @State var isLoading: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "square.and.arrow.down")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                    .padding(.trailing)
                }
                .navigationBarBackButtonHidden(true)
                .padding(.top)
                
                VStack {
                    Spacer()
                    
                    if let generatedImage = generatedImage {
                        Image(uiImage: generatedImage)
                            .resizable()
                            .frame(width: 250, height: 250)
                    } else {
                        Image("placeholderImage")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .opacity(0.5)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 40) {
                        Button(action: {
                            
                        }) {
                            VStack {
                                Image(systemName: "play.fill")
                                    .foregroundColor(.black)
                                    .padding(20)
                                    .background(Color.gray.opacity(0.3))
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                Text("Animate")
                                    .foregroundColor(.black)
                                    .bold()
                                    .font(.caption)
                                    .padding(.top, 5)
                            }
                        }
                        
                        Button(action: {
                            
                        }) {
                            VStack {
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .foregroundColor(.black)
                                    .padding(19)
                                    .background(Color.gray.opacity(0.3))
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                Text("Recreate")
                                    .foregroundColor(.black)
                                    .bold()
                                    .font(.caption)
                                    .padding(.top, 5)
                            }
                        }
                        
                        Button(action: {
                            
                        }) {
                            VStack {
                                Image(systemName: "pencil")
                                    .foregroundColor(.black)
                                    .padding(20)
                                    .background(Color.gray.opacity(0.3))
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                Text("Edit")
                                    .foregroundColor(.black)
                                    .bold()
                                    .font(.caption)
                                    .padding(.top, 5)
                            }
                        }
                    }
                    .padding(.bottom, 50)
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            
                        }) {
                            Text("Publish")
                                .foregroundColor(.white)
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                        
                        Button(action: {
                            
                        }) {
                            Text("Share")
                                .foregroundColor(.black)
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
            }
            
            if isLoading {
                ProgressView()
                    .tint(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear(perform: {
            Task {
                isLoading = true
                generatedImage = await viewModel.generateImage(from: prompt)
                isLoading = false
            }
        })
    }
}

struct GeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorView(viewModel: ViewModel(), prompt: .constant(""))
    }
}
