    public function boot()
    { 
        if (env('APP_ENV') === 'production') {\Illuminate\Support\Facades\URL::forceScheme('https');}

        //set whatever level you want
    error_reporting(E_ALL ^ E_NOTICE);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}