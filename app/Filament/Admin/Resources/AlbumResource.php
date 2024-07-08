<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\AlbumResource\Pages;
use App\Filament\Admin\Resources\AlbumResource\RelationManagers;
use App\Models\Album;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class AlbumResource extends Resource
{
    protected static ?string $model = Album::class;

    protected static ?string $label = 'Álbumes';

    protected static ?string $navigationIcon = 'heroicon-o-musical-note';


    public static function createButtonLabel()
    {
        return 'hola';
        //return __('Create :resource', ['resource' => 'asdasd' . static::singularLabel()]);
        //return __('Create :resource', 'Nuevo álbum');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('label_')
                    ->relationship('label', 'label')
                    ->required(),
                Forms\Components\TextInput::make('album')
                    ->required()
                    ->maxLength(64),
                Forms\Components\TextInput::make('album_clean')
                    ->maxLength(64),
                Forms\Components\TextInput::make('alias')
                    ->required()
                    ->maxLength(64),
                Forms\Components\TextInput::make('views')
                    ->required()
                    ->numeric()
                    ->default(0),
                Forms\Components\TextInput::make('released_year')
                    ->required(),
                Forms\Components\DatePicker::make('released_at'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('artists.artist')
                    ->label('Autor')
                    ->formatStateUsing(function ($record){
                        return $record->authorToString();
                    })/*
                   // ->inverseRelationship('relationship')
                    ->formatStateUsing(function ($record){
                        return $record->authorToString();
                    })
                    //->getStateUsing(fn ($record) => $record->authorToString())
                    //->modifyQueryUsing(fn (Builder $query) => $query->with(['styles', 'artists', 'label', 'relationships']))
                    */
                    ->sortable()
                    ->searchable(), 
                Tables\Columns\TextColumn::make('album')
                    ->label('Título')
                    ->sortable()
                    ->searchable(),
                    /*
                Tables\Columns\TextColumn::make('album_clean')
                    ->searchable(),
                Tables\Columns\TextColumn::make('alias')
                    ->searchable(),
                Tables\Columns\TextColumn::make('views')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('released_at')
                    ->date()
                    ->sortable(),*/
                Tables\Columns\TextColumn::make('label.label')
                    ->label('Discográfica')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('released_year')
                    ->label('Año')
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAlbums::route('/'),
            'create' => Pages\CreateAlbum::route('/create'),
            'edit' => Pages\EditAlbum::route('/{record}/edit'),
        ];
    }
}
