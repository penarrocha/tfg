<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\ImageResource\Pages;
use App\Filament\Admin\Resources\ImageResource\RelationManagers;
use App\Models\Image;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ImageResource extends Resource
{
    protected static ?string $model = Image::class;

    protected static ?string $label = 'Imágenes';

    protected static ?string $navigationIcon = 'heroicon-o-photo';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('src')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('format')
                    ->required(),
                Forms\Components\TextInput::make('description')
                    ->maxLength(255),
                Forms\Components\TextInput::make('imageable_id')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('imageable_type')
                    ->required(),
                Forms\Components\TextInput::make('ordering')
                    ->required()
                    ->numeric()
                    ->default(0),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('src')
                    ->searchable(),
                Tables\Columns\TextColumn::make('format'),
                Tables\Columns\TextColumn::make('description')
                    ->searchable(),
                Tables\Columns\TextColumn::make('imageable_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('imageable_type'),
                Tables\Columns\TextColumn::make('ordering')
                    ->numeric()
                    ->sortable(),
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
            'index' => Pages\ListImages::route('/'),
            'create' => Pages\CreateImage::route('/create'),
            'edit' => Pages\EditImage::route('/{record}/edit'),
        ];
    }
}
