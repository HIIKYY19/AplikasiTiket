<?php

class Jadwal{
    private $koneksi;
    public function __construct(){
        global $dbh;
        $this->koneksi = $dbh;
    }

    public function dataJadwal(){
        $sql = "SELECT * FROM jadwal";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;
    }

    public function getdataJadwal($idjadwal){
        $sql = "SELECT * FROM jadwal
        where idjadwal=? ";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$idjadwal]);
        $rs = $ps->fetch();
        return $rs;
    }

    public function simpan($data){
        $sql = "INSERT INTO jadwal(jam_berangkat,jam_sampai,rute_idrute, armada_idarmada)
        Values(?,?,?,?,?)";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }

    public function ubah($data){
        $sql = "UPDATE jadwal SET
            jam_berangkat=?, jam_sampai=? WHERE idjadwal=?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }

    public function hapus($data){
        $sql = "DELETE FROM jadwal WHERE idjadwal = ?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }

  


}

?>