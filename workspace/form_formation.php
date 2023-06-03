<?php session_start(); ob_start();
$idd = isset($_GET['idd']) ? $_GET['idd'] : header('location: index_admin.php');
?>
<div class="row h-100 justify-content-center" style="min-height: 100vh;">
    <div class="">
        <div class="bg-light rounded">
            <div class="d-flex justify-content-between">
                <h5>Nouvelle Formation</h5>
            </div>
            <form method="post" action="core/formation/add.php">
                <input type="hidden" value="<?php echo $idd; ?>" name="domaine">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="title" id="title" placeholder="Title">
                    <label for="Title">Title</label>
                </div>
                <div class="form-floating mb-3">
                    <textarea class="form-control" name="summary" id="summary" cols="30" rows="10" required placeholder="Summary"></textarea>
                    <label for="summary">Summary</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" name="duration" id="duration" placeholder="Duration">
                    <label for="duration">Duration</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" name="price" id="price" placeholder="0.00 DA">
                    <label for="price">Price</label>
                </div>
                <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Add</button>
            </form>
        </div>
    </div>
</div>
