import 'dart:io';

class Mhs {
  late int nim;
  late String nama;
  late int semester;

  Mhs(this.nim,this.nama,this.semester);
}

class Matkul {
  late String kode;
  late String nama;
  late int sks;

  Matkul(this.kode,this.nama,this.sks);
}

class Nilai {
  late Matkul matkul;
  late double nilai;

  Nilai(this.matkul,this.nilai);
}

class Krs {
  late Mhs mhs;
  late List<Matkul> daftarmatkul =[];
  late List<Nilai> daftarnilai=[];

  Krs(this.mhs);

  void tambahMatkul(Matkul matkul){
    daftarmatkul.add(matkul);
  }

  void tambahNilai(Matkul matkul,double nilai){
    daftarnilai.add(Nilai(matkul, nilai));
  }

  double hitungipk(){
    late double totalnilai = 0.0;
    late int totalsks = 0 ;

    for(var n in daftarnilai){
      totalnilai += n.nilai * n.matkul.sks;
      totalsks += n.matkul.sks;
    }

    return totalsks > 0 ? totalnilai / totalsks : 0.0;
  }

  void cetakkrs(){
    print("\n KRS ");
    print("Nama : ${mhs.nama}");
    print("NIM : ${mhs.nim}");
    print("Semester : ${mhs.semester}");
    for(var matkul in daftarmatkul){
      print("-${matkul.nama} (${matkul.kode}), ${matkul.sks} SKS");
    }
  }

  void cetaknilai(){
    print("Nama Mahasiswa : ${mhs.nama} (${mhs.nim})");
    for(var n in daftarnilai){
      print("-${n.matkul.nama} : ${n.nilai} (${n.matkul.sks} SKS)");
    }
    print("IPK : ${hitungipk().toStringAsFixed(2)}");
  }

  void inputNilai() {
    for (var matkul in daftarmatkul) {
      print("Masukkan nilai untuk mata kuliah ${matkul.nama} (${matkul.kode}): ");
      String? input = stdin.readLineSync();
      double nilai = double.tryParse(input ?? "0") ?? 0;
      tambahNilai(matkul, nilai);
    }
  }

  void pilihmenu() {
  while (true) {
    print("\n--- Menu ---");
    print("1. Cetak KRS");
    print("2. Input Nilai");
    print("3. Transkrip Nilai");
    print("4. Keluar");
    stdout.write("Pilih menu: ");
    String? input = stdin.readLineSync();
    int pilihan = int.tryParse(input ?? "0") ?? 0;

    switch (pilihan) {
      case 1:
        cetakkrs();
        break;
      case 2:
        inputNilai();
        break;
      case 3:
        cetaknilai();
        break;
      case 4:
        print("Keluar dari aplikasi...");
        return;
      default:
        print("Pilihan tidak valid. Silakan coba lagi.");
        break;
    }
  }
}

}