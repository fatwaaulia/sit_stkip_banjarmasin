<style>
.header {
    background-image: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url(<?= base_url('assets/img/api-biru.png') ?>);
    height: 75vh;
    display: flex;
    align-items: center;
}
</style>

<div class="container-fluid header cover-center">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 d-flex justify-content-center">
                <div class="position-relative text-white text-center" id="headerTitle">
                    <h2 class="fw-600 mt-5">
                        Beranda
                    </h2>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="container position-relative bg-white">
    <div class="row">
        <div class="col-lg-6">
            <p class="fw-600 wow fadeInUp" style="border-left:4px solid var(--main-color)">&nbsp; Web App</p>
            <div class="text-justify wow fadeInUp">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Possimus aspernatur quasi, magnam porro labore placeat! At reiciendis voluptates non perferendis suscipit rem placeat, voluptatum ea, saepe, eligendi error cum minima.</p>
            </div>
            <div class="fw-600 wow fadeInUp">
                24 - 27 November 2023 <br>
                KANTOR MORNING LAB <br>
                Jl. Diponegoro No. 345 Genteng, Kabupaten Banyuwangi, Jawa Timur
            </div>
        </div>
    </div>
</section>

<script>
document.addEventListener('scroll', () => {
    const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
    dom('#headerTitle').style.bottom = -(scrollTop / 1.85) + "px";
});
</script>