import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_fullstack/widgets/admin/products/features/add_product/components/product_footer.dart';
import 'package:project_fullstack/widgets/admin/products/features/add_product/components/product_upload_image.dart';
import 'components/product_text_field.dart';
import 'components/product_dropdown_field.dart';
import 'components/product_text_area.dart';
import 'components/product_price_field.dart';
import 'components/product_stock_field.dart';
import 'components/product_status_switch.dart';
import 'package:project_fullstack/controllers/product_controller.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController stokController = TextEditingController();
  final TextEditingController ambangStokController = TextEditingController();

  String kategori = '';
  String status = 'aktif';
  File? imageFile;
  bool isActive = true;
  bool isLoading = false;
  final ProductController productController = ProductController();

  Future<void> submitProduct() async {
    setState(() => isLoading = true);

    String? imageStr;
    if (imageFile != null) {
      imageStr = await productController.uploadImage(imageFile!);
      if (imageStr == null || imageStr.isEmpty) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Gagal upload gambar')));
        return;
      }
    }

    final response = await productController.submitProduct(
      nama: namaController.text,
      kategori: kategori,
      stokAwal: int.tryParse(stokController.text) ?? 0,
      harga: int.tryParse(hargaController.text) ?? 0,
      status: status,
      deskripsi: deskripsiController.text,
      image: imageStr ?? "",
    );

    setState(() => isLoading = false);

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Produk berhasil ditambahkan!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menambah produk: ${response.body}')),
      );
    }
  }

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
            ProductUploadImage(
              onImageSelected: (file) {
                setState(() {
                  imageFile = file;
                });
              },
            ),
            const SizedBox(height: 16),
            ProductTextField(
              label: 'Nama Produk',
              placeholder: 'Masukan nama produk',
              isRequired: true,
              controller: namaController,
            ),
            ProductDropdownField(
              label: 'Kategori Produk',
              placeholder: 'Pilih kategori',
              isRequired: true,
              value: kategori,
              items: const ['Meja', 'Kursi', 'Lemari'],
              onChanged: (val) {
                setState(() {
                  kategori = val;
                });
              },
            ),
            ProductTextArea(
              label: 'Deskripsi Produk',
              placeholder: 'Masukan deskripsi produk',
              controller: deskripsiController,
            ),
            ProductPriceField(controller: hargaController),
            ProductStockField(controller: stokController),
            ProductStatusSwitch(
              isActive: isActive,
              onChanged: (val) {
                setState(() {
                  isActive = val;
                  status = val ? 'Aktif' : 'Nonaktif';
                });
              },
              ambangStokController: ambangStokController,
            ),
            const SizedBox(height: 24),
            AddProductFooter(
              isLoading: isLoading,
              onCancel: () => Navigator.pop(context),
              onSubmit: isLoading ? null : submitProduct,
            ),
          ],
        ),
      ),
    );
  }
}
