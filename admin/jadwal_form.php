<?php
error_reporting(0);
$data_jadwal = new Jadwal();
$data_jadwal = $data_jadwal->dataJadwal();

$idedit = $_REQUEST ['idedit'];
$obj_jadwal = new Jadwal();
if(!empty($idedit)){
  $jadwal = $obj_jadwal->getdataJadwal($idedit);
} else {
  $jadwal = array();
}
?>

<!-- form mulai -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<h1 align="center">Pengisian Data Jadwal</h1><br>
<form action="jadwal_controller.php" method="POST">

<div class="form-group row">
    <label for="text1" class="col-4 col-form-label">Tanggal</label> 
    <div class="col-8">
      <input id="text1" name="jam_berangkat" type="date" class="form-control" value="<?= $jadwal ['tanggal'] ?>">
    </div>
  </div>
<div class="form-group row">
    <label for="text1" class="col-4 col-form-label">Jam Berangkat</label> 
    <div class="col-8">
      <input id="text1" name="jam_berangkat" type="time" class="form-control" value="<?= $jadwal ['jam_berangkat'] ?>">
    </div>
  </div>   
<div class="form-group row">
    <label for="text1" class="col-4 col-form-label">Jam Sampai</label> 
    <div class="col-8">
      <input id="text1" name="jam_sampai" type="time" class="form-control" value="<?= $jadwal ['jam_sampai'] ?>">
    </div>
  </div> 
  
 
  <div class="form-group row">
    <div class="offset-4 col-8">
    <?php
    if(empty($idedit)){ ?>
      <button name="proses" value="simpan" type="submit" class="btn btn-primary">Submit</button>
      <?php } else {
        ?>
        <button type="submit" name="proses" value="ubah" class="btn btn-success">Ubah</button>
      <?php } ?>
      <input type="hidden" name="idx" value="<?= $idedit; ?> ">

    </div>
  </div>
</form>