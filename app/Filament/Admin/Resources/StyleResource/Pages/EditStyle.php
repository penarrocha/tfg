<?php

namespace App\Filament\Admin\Resources\StyleResource\Pages;

use App\Filament\Admin\Resources\StyleResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditStyle extends EditRecord
{
    protected static string $resource = StyleResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
