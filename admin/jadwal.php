<?php
$model = new Jadwal();
$data_jadwal = $model->dataJadwal();

$member = $_SESSION['MEMBER'];
if(isset($member)) {

} else {
    echo '<script> alert("anda tidak boleh masuk"); history.back();</script>';
}
?>

?>

<main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">JADWAL</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Jadwal</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                <a href="index.php?url=jadwal_form">
                                    <button class="btn btn-sm btn-primary">Tambah</button>
                                </a>
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Id Jadwal</th>
                                            <th>Tangggal</th>
                                            <th>Jam Berangkat</th>
                                            <th>Jam Sampai</th>
                                            <th>Rute</th>
                                            <th>Armada</th>
                                            <th>aksi</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                            <th>No</th>
                                            <th>Id Jadwal</th>
                                            <th>Tangggal</th>
                                            <th>Jam Berangkat</th>
                                            <th>Jam Sampai</th>
                                            <th>Rute</th>
                                            <th>Armada</th>
                                            <th>aksi</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <?php
                                        $no = 1;
                                        foreach ($data_jadwal as $ja){

                                        ?>
                                        <tr>
                                            <td><?= $no++ ?></td>
                                            <td><?= $ja['idjadwal'] ?></td>
                                            <td><?= $ja['tanggal'] ?></td>
                                            <td><?= $ja['jam_berangkat'] ?></td>
                                            <td><?= $ja['jam_sampai'] ?></td>
                                            <td><?= $ja['rute_idrute'] ?></td>
                                            <td><?= $ja['armada_idarmada'] ?></td>
                                            <td>
                                                <form action="jadwal_controller.php" method="POST">
                                                    <a href="index.php?url=jadwal_form&idedit=<?= $ja['idjadwal'] ?>">
                                                        <button type="button" class="btn btn-success btn-sm">Ubah</button>
                                                    </a>
                                                    
                                                    <!-- tombol hapus -->
                                                    <button type="submit" class="btn btn-danger btn-sm" name="proses" value="hapus"
                                                    onclick="return confirm('Anda yakin menghapus?')">
                                                        Hapus
                                                    </button>
                                                    <input type="hidden" name="idx" value="<?= $ja['idjadwal']; ?>" />

                                                </form>
                                            </td>
                                        </tr>
                                        <?php

                                        }

                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>