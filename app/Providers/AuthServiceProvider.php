<?php

namespace App\Providers;

use App\Models\Team;
use App\Policies\TeamPolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Auth\Notifications\ResetPassword;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        Team::class => TeamPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        // dd(request(), request()->path());
        $this->registerPolicies();
        VerifyEmail::toMailUsing(function ($notifiable, $url) {
            $customUrl = '';
            if (request()->baseDomain === 'customer') {
                $customUrl = config('app.customer_base_domain');
            } else if (request()->baseDomain === 'seller') {
                $customUrl = config('app.seller_base_domain');
            } else if (request()->baseDomain === 'admin') {
                $customUrl = config('app.admin_base_domain');
            }
            $url = str_replace(url('/'), $customUrl, $url);

            return (new MailMessage)
                ->subject('Verify Email Address updated')
                ->line('Click the button below to verify your email address.updated')
                ->action('Verify Email Address updated', $url);
        });
        ResetPassword::createUrlUsing(function ($user, string $token) {
            $url = '';
            if ($user->getRoleNames()->contains('customer')) {
                $url = config('app.customer_base_domain');
            } else if ($user->getRoleNames()->contains('seller')) {
                $url = config('app.seller_base_domain');
            } else if ($user->getRoleNames()->contains('admin')) {
                $url = config('app.admin_base_domain');
            }
            return $url . '/account/reset?token=' . $token;
        });
    }
}
