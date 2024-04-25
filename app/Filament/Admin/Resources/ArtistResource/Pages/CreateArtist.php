<?php

namespace App\Filament\Admin\Resources\ArtistResource\Pages;

use App\Filament\Admin\Resources\ArtistResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateArtist extends CreateRecord
{
    protected static string $resource = ArtistResource::class;
}
