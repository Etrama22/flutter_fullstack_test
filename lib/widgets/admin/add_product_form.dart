import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductForm extends StatelessWidget {
  const AddProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tambah Produk',
              style: TextStyle(
                color: Color(0xFF050506),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Masukkan detail produk untuk menambahkannya ke inventaris.',
              style: TextStyle(
                color: Color(0xFF5D6471),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.43,
              ),
            ),
            const SizedBox(height: 20),

            UploadImageSection(),

            const SizedBox(height: 16),

            _TextField(
              label: 'Nama Produk',
              placeholder: 'Masukan nama produk',
              isRequired: true,
            ),
            _DropdownField(
              label: 'Kategori Produk',
              placeholder: 'Pilih kategori',
              isRequired: true,
            ),
            _TextArea(
              label: 'Deskripsi Produk',
              placeholder: 'Masukan deskripsi produk',
            ),
            _PriceField(),
            _StockField(),
            _StatusSwitch(),
          ],
        ),
      ),
    );
  }
}

class UploadImageSection extends StatefulWidget {
  final Function(File?)? onImageSelected;

  const UploadImageSection({super.key, this.onImageSelected});

  @override
  State<UploadImageSection> createState() => _UploadImageSectionState();
}

class _UploadImageSectionState extends State<UploadImageSection> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
      widget.onImageSelected?.call(_selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PREVIEW GAMBAR
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8F9),
            borderRadius: BorderRadius.circular(12),
            image: _selectedImage != null
                ? DecorationImage(
                    image: FileImage(_selectedImage!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: _selectedImage == null
              ? const Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 40,
                    color: Colors.grey,
                  ),
                )
              : null,
        ),
        const SizedBox(height: 16),
        // TOMBOL UPLOAD
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE7EAEF)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Unggah Gambar',
                style: TextStyle(
                  color: Color(0xFF020C1F),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isRequired;

  const _TextField({
    required this.label,
    required this.placeholder,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF020C1F),
                ),
              ),
              if (isRequired)
                const Text(
                  '*',
                  style: TextStyle(color: Color(0xFFEB2F2F), fontSize: 14),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE7EAEF)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              placeholder,
              style: const TextStyle(
                color: Color(0xFF7C828C),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isRequired;

  const _DropdownField({
    required this.label,
    required this.placeholder,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF020C1F),
                ),
              ),
              if (isRequired)
                const Text(
                  '*',
                  style: TextStyle(color: Color(0xFFEB2F2F), fontSize: 14),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE7EAEF)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  placeholder,
                  style: const TextStyle(
                    color: Color(0xFF7C828C),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF5B5C63),
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TextArea extends StatelessWidget {
  final String label;
  final String placeholder;

  const _TextArea({required this.label, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF020C1F),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE7EAEF)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(12),
            alignment: Alignment.topLeft,
            child: Text(
              placeholder,
              style: const TextStyle(
                color: Color(0xFF7C828C),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceField extends StatelessWidget {
  const _PriceField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Harga Produk',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF020C1F),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE7EAEF)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.centerLeft,
            child: const Row(
              children: [
                Text(
                  'Rp',
                  style: TextStyle(
                    color: Color(0xFF5B5C63),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '0',
                  style: TextStyle(
                    color: Color(0xFF7C828C),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StockField extends StatelessWidget {
  const _StockField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Stok Produk',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF020C1F),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE7EAEF)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Masukan jumlah stok',
              style: TextStyle(
                color: Color(0xFF7C828C),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusSwitch extends StatefulWidget {
  const _StatusSwitch();

  @override
  State<_StatusSwitch> createState() => _StatusSwitchState();
}

class _StatusSwitchState extends State<_StatusSwitch> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Status Produk',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF020C1F),
            ),
          ),
          Switch(
            value: isActive,
            activeThumbColor: Colors.white,
            activeTrackColor: const Color(0xFFFF7900),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFE6E9EF),
            onChanged: (val) => setState(() => isActive = val),
          ),
        ],
      ),
    );
  }
}

class AddProductFooter extends StatefulWidget {
  const AddProductFooter({super.key});

  @override
  State<AddProductFooter> createState() => _AddProductFooterState();
}

class _AddProductFooterState extends State<AddProductFooter> {
  bool isFilled = false; // nanti bisa dihubungkan sama controller tiap field

  // sementara buat demo, tekan lama buat ubah status
  void toggleFilled() {
    setState(() {
      isFilled = !isFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFE7EAEF)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Batal',
                  style: TextStyle(
                    color: Color(0xFF020C1F),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.43,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: GestureDetector(
              onTap: isFilled
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Produk berhasil ditambahkan!'),
                        ),
                      );
                    }
                  : null,
              onLongPress: toggleFilled, // buat test toggle manual dulu
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: ShapeDecoration(
                  color: isFilled
                      ? const Color(0xFFFF7900)
                      : const Color(0xFFC0C4CC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Tambah',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 1.43,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.add, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
