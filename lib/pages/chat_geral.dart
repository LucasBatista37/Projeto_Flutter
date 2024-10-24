import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatGeralScreen extends StatefulWidget {
  const ChatGeralScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatGeralScreenState createState() => _ChatGeralScreenState();
}

class _ChatGeralScreenState extends State<ChatGeralScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image;
  final List<Widget> _messages = [];
  String? _fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF9A00),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Chat',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _messages[index];
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: _pickImageFromCamera,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Mensagem',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_image != null || _fileName != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 80,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_image != null) ...[
                      Image.file(
                        _image!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ] else if (_fileName != null) ...[
                      const Icon(Icons.attach_file,
                          color: Colors.white, size: 40),
                      Text(
                        'Arquivo selecionado: $_fileName',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _image = null;
                            _fileName = null;
                          });
                        },
                        child: const Text('Remover'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _pickImageFromCamera() async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      // Permissão já concedida
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
          _fileName = null;
        });
      }
    } else if (status.isDenied) {
      // Permissão ainda não concedida, solicitar
      final result = await Permission.camera.request();

      if (result.isGranted) {
        final pickedFile = await _picker.pickImage(source: ImageSource.camera);

        if (pickedFile != null) {
          setState(() {
            _image = File(pickedFile.path);
            _fileName = null;
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Permissão para acessar a câmera negada')),
        );
      }
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Permissão permanentemente negada. Abra as configurações para concedê-la.',
          ),
        ),
      );
      openAppSettings();
    }
  }

  void _sendMessage() {
    final message = _messageController.text.trim();

    if (message.isNotEmpty || _image != null || _fileName != null) {
      setState(() {
        _messages.add(
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 209, 141, 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (_image != null) ...[
                    Image.file(_image!),
                    const SizedBox(height: 8),
                  ],
                  if (_fileName != null) ...[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.attach_file, size: 20),
                        const SizedBox(width: 4),
                        Text('$_fileName'),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                  if (message.isNotEmpty) Text(message),
                ],
              ),
            ),
          ),
        );
        _messageController.clear();
        _image = null;
        _fileName = null;
      });
    }
  }
}