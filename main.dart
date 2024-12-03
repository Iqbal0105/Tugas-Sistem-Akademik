import '../lib/mahasiswa.dart';

void main() {
  Mhs mhs1 = Mhs(230103270, "Iqbal", 3);

  Matkul matkul1 = Matkul("AB12", "Bahasa Inggris", 2);
  Matkul matkul2 = Matkul("AC03", "Pemrograman Web 2", 3);
  Matkul matkul3 = Matkul("AZ12", "Statistik", 3);
  Matkul matkul4 = Matkul("AC09", "Matematika Diskrit", 3);
  Matkul matkul5 = Matkul("AD04", "Pemrograman Berbasis Objek", 3);
  Matkul matkul6 = Matkul("AX12", "Pemrograman Basis Data", 3);
  Matkul matkul7 = Matkul("BY14", "Rekayasa Perangkat Lunak", 3);
  Matkul matkul8 = Matkul("BF06", "Kewirausahaan", 3);

  Krs krs = Krs(mhs1);
  krs.tambahMatkul(matkul1);
  krs.tambahMatkul(matkul2);
  krs.tambahMatkul(matkul3);
  krs.tambahMatkul(matkul4);
  krs.tambahMatkul(matkul5);
  krs.tambahMatkul(matkul6);
  krs.tambahMatkul(matkul7);
  krs.tambahMatkul(matkul8);

  krs.pilihmenu();
}