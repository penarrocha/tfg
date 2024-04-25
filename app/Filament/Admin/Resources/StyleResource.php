<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\StyleResource\Pages;
use App\Filament\Admin\Resources\StyleResource\RelationManagers;
use App\Models\Style;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class StyleResource extends Resource
{
    protected static ?string $model = Style::class;

    protected static ?string $navigationIcon = 'heroicon-o-cube';

    protected static ?string $label = 'Estilos / Géneros';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('style')
                    ->required()
                    ->maxLength(32),
                Forms\Components\TextInput::make('alias')
                    ->required()
                    ->maxLength(32),
                Forms\Components\Textarea::make('description')
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('style')
                    ->searchable(),
                Tables\Columns\TextColumn::make('alias')
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
            'index' => Pages\ListStyles::route('/'),
            'create' => Pages\CreateStyle::route('/create'),
            'edit' => Pages\EditStyle::route('/{record}/edit'),
        ];
    }
}
