<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\ArtistResource\Pages;
use App\Filament\Admin\Resources\ArtistResource\RelationManagers;
use App\Models\Artist;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ArtistResource extends Resource
{
    protected static ?string $model = Artist::class;

    protected static ?string $label = 'Artistas / Grupos';

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('artist')
                    ->required()
                    ->maxLength(64),
                Forms\Components\TextInput::make('artist_clean')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('alias')
                    ->required()
                    ->maxLength(64),
                Forms\Components\TextInput::make('url')
                    ->maxLength(255),
                Forms\Components\Textarea::make('description')
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('artist')
                    ->searchable(),
                Tables\Columns\TextColumn::make('artist_clean')
                    ->searchable(),
                Tables\Columns\TextColumn::make('alias')
                    ->searchable(),
                Tables\Columns\TextColumn::make('url')
                    ->searchable(),
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
            'index' => Pages\ListArtists::route('/'),
            'create' => Pages\CreateArtist::route('/create'),
            'edit' => Pages\EditArtist::route('/{record}/edit'),
        ];
    }
}
