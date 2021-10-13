//
//  SettingsView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            
            Form{
                
                Section(header: Text("General settings")) {
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            Image(systemName: "person.fill")
                                .foregroundColor(.blue)
                            Text("About me")
                        })
                    NavigationLink(
                        destination: PickerView(),
                        label: {
                            Image(systemName: "camera.fill")
                                .foregroundColor(.blue)

                            Text("My Gallery")
                        })
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            Image(systemName: "deskclock.fill")
                                .foregroundColor(.blue)

                            Text("Reminder")
                        })
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            Image(systemName: "clock.arrow.circlepath")
                                .foregroundColor(.blue)

                            Text("History")
                        })
                    NavigationLink(
                        destination: ProfileView(),
                        label: {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.blue)

                            Text("Settings")
                        })

                    
                    
                    Toggle(isOn: .constant(true), label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                        Text("Apple Health")
                    })
                    
                    
                    Toggle(isOn: .constant(true), label: {
                        Image(systemName: "moon.circle")
                            .foregroundColor(.gray)
                        Text("Dark mode")
                    })

                }

                Section(header: Text("Support us")) {
                    
                    NavigationLink(
                        destination: Text("support"),
                        label: {
                            Text("Support us")
                        })
                }
            }
            .navigationTitle("Settings")

        }
        .navigationBarHidden(true)

    }
}

struct PickerView: View {
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State var image: UIImage?
    
    var body: some View {
                    
            VStack {
                
                Button(action: {
                    
                    self.showSheet = true

                }, label: {
                    
                    if image != nil {
                        Image(uiImage: image!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.gray.opacity(0.2))
                            .frame(width: 100, height: 100)
                    }
                }).padding()
                    .actionSheet(isPresented: $showSheet) {
                        ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                            .default(Text("Photo Library")) {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                            },
                            .default(Text("Camera")) {
                                self.showImagePicker = true
                                self.sourceType = .camera
                            },
                            .cancel()
                        ])
                }
                
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
    }
}

//struct PictureView : View {
//    @State var isShowingImagePicker = false
//    @State var imageInBlackBox = UIImage()
//
//    var body: some View{
//
//        VStack{
//
//            Image(uiImage: imageInBlackBox)
//                .resizable()
//                .scaledToFill()
//                .frame(width: 200, height: 200)
//                .border(Color.black,width: 1)
//                .clipped()
//            Button(action: {
//                self.isShowingImagePicker.toggle()
//            }, label: {
//                Text("Select Image")
//                    .font(.system(size: 32))
//            })
//                .sheet(isPresented: $isShowingImagePicker, content: {
//                    ImagePickerView(isPresented: self.$isShowingImagePicker,seclectedImage: self.$imageInBlackBox)
//                })
//        }
//    }
//}
//
//struct ImagePickerView: UIViewControllerRepresentable {
//
//    @Binding var isPresented: Bool
//    @Binding var seclectedImage: UIImage
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) ->  UIViewController {
//
//        let controller = UIImagePickerController()
//        controller.delegate = context.coordinator
//
//        return controller
//    }
//
//    func makeCoordinator() -> ImagePickerView.Coordinator {
//
//        return Coordinator(parent: self)
//    }
//
//    class Coordinator: NSObject, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
//
//        let parent: ImagePickerView
//        init(parent:ImagePickerView) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let selectedImageFromPicker = info[.originalImage] as? UIImage {
//                print(selectedImageFromPicker)
//                self.parent.seclectedImage = selectedImageFromPicker
//            }
//            self.parent.isPresented = false
//        }
//    }
//
//    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
//
//
//    }
//}
//
//struct DummyView: UIViewRepresentable {
//
//    func makeUIView(context: UIViewRepresentableContext<DummyView>) ->  UIButton {
//
//        let button = UIButton()
//        button.setTitle("DUMMY", for: .normal)
//        button.backgroundColor = .red
//        return button
//    }
//
//    func updateUIView(_ uiView: DummyView.UIViewType, context: UIViewRepresentableContext<DummyView>) {
//
//    }
//}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
