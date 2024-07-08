<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\SongResource\Pages;
use App\Filament\Admin\Resources\SongResource\RelationManagers;
use App\Models\Song;
use App\Models\Album;
use Illuminate\Database\Query\JoinClause;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SongResource extends Resource {

    protected static ?string $model = Song::class;
    protected static ?string $label = 'Canciones';
    protected static ?string $navigationIcon = 'heroicon-o-speaker-wave';

    public static function form(Form $form): Form {
        return $form
            ->schema([
                Forms\Components\Select::make('album_id')
                    ->label('Álbum')
                    ->options(function (): array {
                        $albums = Album::with(['artists', 'relationships'])
                            ->select(['albums.*', 'a.artist'])
                            ->join('album_artist AS aa', 'albums.id', '=', 'aa.album_id')
                            ->join('artists AS a', 'aa.artist_id', '=', 'a.id')
                            ->groupBy('aa.album_id')
                            ->orderBy('a.artist', 'asc')
                            ->orderBy('albums.album', 'asc')
                            ->get();
                        $data = [];
                        foreach ($albums as $a) {
                            $data[$a->id] = $a->authorToString() . ' - ' . $a->album;
                        }
                        return $data;
                    })
                    ->required(),
                Forms\Components\TextInput::make('song')
                    ->required()
                    ->maxLength(64),
                Forms\Components\TextInput::make('song_clean')
                    ->maxLength(64),
                Forms\Components\TextInput::make('duration')
                    ->maxLength(7),
                Forms\Components\Textarea::make('lyrics')
                    ->columnSpanFull(),
                Forms\Components\Textarea::make('lyrics_clean')
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('views')
                    ->required()
                    ->numeric()
                    ->default(0),
            ]);
    }

    public static function table(Table $table): Table {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('album.album')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('song')
                    ->searchable(),
                Tables\Columns\TextColumn::make('song_clean')
                    ->searchable(),
                Tables\Columns\TextColumn::make('duration')
                    ->searchable(),
                Tables\Columns\TextColumn::make('views')
                    ->numeric()
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

    public static function getRelations(): array {
        return [
            //
        ];
    }

    public static function getPages(): array {
        return [
            'index' => Pages\ListSongs::route('/'),
            'create' => Pages\CreateSong::route('/create'),
            'edit' => Pages\EditSong::route('/{record}/edit'),
        ];
    }
}
