<?php
include_once 'koneksi.php';
include_once 'models/Jadwal.php';

$jam_berangkat = $_POST ['jam_berangkat'];
$jam_sampai = $_POST ['jam_sampai'];
$data = [
   $jam_berangkat, $jam_sampai
];

$model = new Jadwal();
$submit = $_REQUEST['proses'];
switch ($submit) {
    case 'simpan':
        $model->simpan($data);
        break;
    case 'ubah' : 
        $data[] = $_POST['idx']; 
        $model->ubah($data); 
        break;
    case 'hapus' :
        unset($data);
        $data[] = $_POST['idx'];
        $model->hapus($data);
        break;
    
        default:
        header('Location:index.php?url=jadwal');
        break;
    }
    header('Location:index.php?url=jadwal');
    
?>