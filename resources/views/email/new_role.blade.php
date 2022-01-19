<h1>Dear, {{ $data->name }}</h1>
<p>Your Seller request  has been approved by Admin.</p>
<p>Now You has been registered.</p>
<p>Login Url :{{env('SELLER_BASE_DOMAIN')}} </p>
<p>Email :  {{ $data->email }}</p>
<p>Password: <b>{{$data->password}}</b></p>
<p>Thanks.</p>