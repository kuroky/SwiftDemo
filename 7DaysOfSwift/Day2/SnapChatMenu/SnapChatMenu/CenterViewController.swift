//
//  CenterViewController.swift
//  SnapChatMenu
//
//  Created by kuroky on 2018/4/28.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit
import AVFoundation

class CenterViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    @IBOutlet weak var cameraView: UIView!
    var captureSession: AVCaptureSession?
    var captureDeviceInput: AVCaptureDeviceInput?
    var stillImgeOutput: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
    }

    func setupData() {
    }
    
    func loadMyCamera() {
        // 1.创建会话
        self.captureSession = AVCaptureSession()
        self.captureSession?.sessionPreset = AVCaptureSession.Preset.high
        self.captureSession?.startRunning()
        
        // 2.创建输入设备
        let captureDevice = AVCaptureDevice.default(for: .video)
        var error: NSError?
        
        do { // 3.创建输入源
            self.captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice!)
        } catch let error1 as NSError {
            error = error1
        }
        
        if (error != nil || self.captureSession?.canAddInput(self.captureDeviceInput!) == false) {
            return
        }
        
        // 4.创建图像输出
        self.stillImgeOutput = AVCapturePhotoOutput()
        
        // 5.连接输入与会话
        self.captureSession?.addInput(self.captureDeviceInput!)
        
        // 6.连接输出与会话
        if (self.captureSession?.canAddOutput(self.stillImgeOutput!) == false) {
            return
        }
        self.captureSession?.addOutput(self.stillImgeOutput!)
        
        // 7.预览画面
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession!)
        self.previewLayer.frame = self.cameraView.bounds
        self.previewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        self.previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        self.cameraView.layer.insertSublayer(self.previewLayer, at: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func setupUI() {
        DispatchQueue.main.async {
            //self.loadCamera()
            self.loadMyCamera()
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        let imageData = photo.fileDataRepresentation()
        let image = UIImage.init(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(image!, self, nil, nil)
    }
    
    @IBAction func clickCameraButton(_ sender: UIButton) {
        let settings = AVCapturePhotoSettings()
        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
        let previewFormat: [String: Any] = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
                             kCVPixelBufferWidthKey as String: 160,
                             kCVPixelBufferHeightKey as String: 160]
        settings.previewPhotoFormat = previewFormat
        stillImgeOutput?.capturePhoto(with: settings, delegate: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
