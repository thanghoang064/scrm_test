<form method="post" class="form-inline">
	<div class="form-group">
	<label for="phone">Nhập SĐT chính xác cần tìm: </label>
	<input class="form-control" type="phone" id="phone" name="phone" required value="{$phone}" autofocus>
	<button class="btn btn-default" type="submit" name="find" value="find">Tìm kiếm</button>
	</div>
</form>
{if !empty($phone)}
{if !empty($data)}
<br />
<table class="table table-hover table-bordered table-responsive">
	<tr>
		<td><strong>Cơ sở</strong></td>
		<td>{$data.area}</td>
	</tr>
	<tr>
		<td><strong>Ngày sinh</strong></td>
		<td>{$data.birthdate}</td>
	</tr>
	<tr>
		<td><strong>Họ và tên</strong></td>
		<td>{$data.name}</td>
	</tr>
	<tr>
		<td><strong>SĐT SV 1</strong></td>
		<td>{$data.phone1}</td>
	</tr>
	<tr>
		<td><strong>SĐT SV 2</strong></td>
		<td>{$data.phone3}</td>
	</tr>
	<tr>
		<td><strong>SĐT PH 1</strong></td>
		<td>{$data.phone2}</td>
	</tr>
	<tr>
		<td><strong>SĐT PH 2</strong></td>
		<td>{$data.phone4}</td>
	</tr>
	<tr>
		<td><strong>Nguồn</strong></td>
		<td>{$data.source}</td>
	</tr>
	<tr>
		<td><strong>Lead Source</strong></td>
		<td>{$data.lead_source}</td>
	</tr>
	<tr>
		<td><strong>Rating</strong></td>
		<td>{$data.rating}</td>
	</tr>
	<tr>
		<td><strong>Email</strong></td>
		<td>{$data.email}</td>
	</tr>
	<tr>
		<td><strong>Facebook</strong></td>
		<td>{$data.email}</td>
	</tr>
	<tr>
		<td><strong>Telesales</strong></td>
		<td>{$data.telesales}</td>
	</tr>
	<tr>
		<td><strong>Ngày tạo</strong></td>
		<td>{$data.date_entered}</td>
	</tr>
	<tr>
		<td><strong>Promoter</strong></td>
		<td>{$data.created_by}</td>
	</tr>
</table>
{else}
<div class="alert alert-danger">
Không tìm thấy lead nào có số điện thoại là '<strong>{$phone}</strong>'!
</div>
{/if}
{/if}