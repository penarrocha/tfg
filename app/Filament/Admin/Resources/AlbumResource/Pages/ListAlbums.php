<?php

namespace App\Filament\Admin\Resources\AlbumResource\Pages;

use App\Filament\Admin\Resources\AlbumResource;
use Filament\Actions;
use Filament\Actions\Action;
use Filament\Resources\Pages\ListRecords;

class ListAlbums extends ListRecords
{
    protected static string $resource = AlbumResource::class;
    protected static ?string $title = 'Álbumes';

    protected function getHeaderActions(): array
    {
        return [
            //Actions\CreateAction::make(),
            $this->getCreateFormAction()
        ];
    }
    protected function getCreateFormAction(): Action {
        return Action::make('create')
        //->label(__('filament-panels::resources/pages/create-record.form.actions.create.label'))
        ->label('Nuevo álbum')
        //->icon('heroicon-o-check')
        ->icon('heroicon-o-plus-circle')
        //->icon('heroicon-o-document-text')
        ->submit('create')
        ->keyBindings(['mod+s']);
    }
}
