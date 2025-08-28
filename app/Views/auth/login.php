<?php
$app_settings = model('AppSettings')->find(1);
$logo_web = webFile('image', 'app_settings', $app_settings['logo'], $app_settings['updated_at']);
?>

<style>
body { overflow: hidden; }
</style>

<section class="container">
	<div class="row justify-content-center align-items-center vh-100">
		<div class="col-xl-4 col-lg-4 col-md-6 col-12">
			<div class="card my-4 pt-3 pb-1">
				<div class="card-body">
					<div class="text-center">
                        <img src="<?= $logo_web ?>" alt="<?= $app_settings['nama_aplikasi'] ?>" class="wh-100">
						<h3 class="mb-1 fw-600">Selamat Datang!</h3>
						<p>VISIONER - STKIP ISM BANJARMASIN</p>
					</div>
					<hr>
					<form id="form">
						<div class="mb-3">
                            <input type="text" class="form-control" id="username" name="username" placeholder="username">
                            <div class="invalid-feedback" id="invalid_username"></div>
                        </div>
					    <div class="mb-3">
							<div class="d-flex justify-content-between">
								<label class="form-label" for="password">Password</label>
								<a href="<?= base_url('password/forgot') ?>">
									<small>Lupa Password?</small>
								</a>
							</div>
							<div class="position-relative">
								<input type="password" class="form-control" id="password" name="password" placeholder="Password" autocomplete="off">
								<div class="invalid-feedback" id="invalid_password"></div>
								<img src="<?= base_url('assets/icons/show.png') ?>" class="position-absolute" id="eye_password">
							</div>
						</div>
						<button type="submit" class="btn btn-primary w-100">Masuk</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
function toggleVisibility(inputElement, eyeElement) {
	const showIcon = "<?= base_url('assets/icons/show.png') ?>";
    const hideIcon = "<?= base_url('assets/icons/hide.png') ?>";
    inputElement.type = password.type === 'password' ? 'text' : 'password';
    eyeElement.src = password.type === 'password' ? showIcon : hideIcon;
}

dom('#eye_password').addEventListener('click', () => {
    toggleVisibility(dom('#password'), dom('#eye_password'));
});

sessionStorage.removeItem("sidebarScrollPosition");

const timezone = Intl.DateTimeFormat().resolvedOptions().timeZone;
if (timezone != '<?= session('timezone') ?>') {
    fetch(`<?= base_url() ?>session/set/timezone`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ timezone: 'Asia/Makassar' })
    });
}
</script>

<script>
dom('#form').addEventListener('submit', function(event) {
    event.preventDefault();
	const endpoint = '<?= base_url() ?>api/login';
    submitData(dom('#form'), endpoint);
});
</script>
