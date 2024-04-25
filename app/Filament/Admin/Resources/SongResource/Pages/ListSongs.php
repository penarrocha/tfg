<?php

namespace App\Filament\Admin\Resources\SongResource\Pages;

use App\Filament\Admin\Resources\SongResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSongs extends ListRecords
{
    protected static string $resource = SongResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
