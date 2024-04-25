<?php

namespace App\Filament\Admin\Resources\ArtistResource\Pages;

use App\Filament\Admin\Resources\ArtistResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditArtist extends EditRecord
{
    protected static string $resource = ArtistResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
