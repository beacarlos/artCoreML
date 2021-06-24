//
//  ChooseImage.swift
//  Art
//
//  Created by Beatriz Carlos on 21/06/21.
//

import UIKit

class ChooseImage: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Instância o controle do sistema de imagens
    var picker = UIImagePickerController();
    
    // Cria um alerta
    var alert = UIAlertController(title: "Escolha uma opção", message: nil, preferredStyle: .actionSheet)
    
    // Cria um UIViewController
    var viewController: UIViewController?
    
    // Cria um callback @escaping
    var returnPicker: ((UIImage) -> ())?;
    
    
    // Função principal
    func pickerImage(_ viewController: UIViewController, _ returnCompletion: @escaping ((UIImage) -> ())) {
        
        // Declara o callback dessa funcao como sendo a variavel externa pickImageCallback, isso serve para o retorno dessa funcao estar em outro metodo, no caso, apos a escolha da imagem
        returnPicker = returnCompletion;
        
        // Declara o viewController como o passado como parametro, isso serve para as transicoes de tela.
        self.viewController = viewController;
        
        // Cria uma acao que chama o metodo "openCamera"
        let camera = UIAlertAction(title: "Camera", style: .default){
            UIAlertAction in
            self.abrirCamera()
        }
        // Cria uma acao que chama o metodo "abrirGaleria"
        let gallery = UIAlertAction(title: "Galeria", style: .default){
            UIAlertAction in
            self.openGallery()
        }
        
        // Cria uma outra acao
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel){
            UIAlertAction in
        }
        
        // Declara que o novo delegate do piker são os métodos abaixo
        picker.delegate = self
        
        
        // Adiciona acoes ao alerta
        alert.addAction(camera)
        alert.addAction(gallery)
        alert.addAction(cancel)
        
        //Exibe o alerta na tela
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alert, animated: true, completion: nil)
    }
    
    
    //Abre a câmera
    func abrirCamera(){
        //Desfaz o alerta de seleção gerado anteriormete
        alert.dismiss(animated: true, completion: nil)
        
        //Aqui verificamos se temos a permissão para acessar a camera
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            //Define o tipo que queremos selecionar como a câmera
            picker.sourceType = .camera
            //Vai para a tela da Câmera
            self.viewController?.present(picker, animated: true, completion: nil)
        } else {
            //Gera alerta se a pessoa não possue câmera no dispositivo ou caso você rode em um simulador.
            let alert = UIAlertController(title: "Alerta", message: "Você não tem câmera", preferredStyle: .actionSheet)
            //Cria uma outra ação
            let cancel = UIAlertAction(title: "Cancelar", style: .cancel){
                UIAlertAction in
            }
            //Mostra alerta
            alert.addAction(cancel)
            self.viewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery(){
        alert.dismiss(animated: true, completion: nil)
        
        picker.sourceType = .photoLibrary
        
        self.viewController?.present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)

        guard let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage  else {
            fatalError("Esperava-se uma imagem, mas foi dado o seguinte: \(info)")
        }
        returnPicker?(userPickedImage)
    }
}
