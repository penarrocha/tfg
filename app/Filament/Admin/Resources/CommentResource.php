<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\CommentResource\Pages;
use App\Filament\Admin\Resources\CommentResource\RelationManagers;
use App\Models\Comment;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CommentResource extends Resource
{
    protected static ?string $model = Comment::class;
    
    protected static ?string $label = 'Comentarios';

    protected static ?string $navigationIcon = 'heroicon-o-chat-bubble-oval-left-ellipsis';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('user_id')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('comment')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('commentable_id')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('commentable_type'),
                Forms\Components\DateTimePicker::make('date_created'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('user_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('comment')
                    ->searchable(),
                Tables\Columns\TextColumn::make('commentable_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('commentable_type'),
                Tables\Columns\TextColumn::make('date_created')
                    ->dateTime()
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
            'index' => Pages\ListComments::route('/'),
            'create' => Pages\CreateComment::route('/create'),
            'edit' => Pages\EditComment::route('/{record}/edit'),
        ];
    }
}
