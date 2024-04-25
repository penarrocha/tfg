<?php

namespace App\Http\Controllers;

use App\Models\Album;
use App\Models\Style;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StyleController extends Controller {
    

    public function index() : View {
        //$styles = Style::all();
        $styles = Style::with(['albums', 'albums.songs'])->select('styles.*')
                        ->join('album_style AS ast', 'styles.id', '=', 'ast.style_id')
                        ->groupBy('ast.style_id')
                        ->orderBy('styles.style', 'asc')
                        ->get();
        return view('styles', ['styles' => $styles]);
    }

    public function style(string $alias) : View {
        /*
        $style = Style::where('alias', '=', $alias)
                ->firstOrFail();
        // 22 - 32 querys
        
        $albums = $style->albums;
        return view('style', [
            'style' => $style, 
            'albums' => $albums, 
            'songsNumber' => 15//$style->getNumberOfSongs()
        ]);
        
        */
        
        $style = Style::where('alias', '=', $alias)->firstOrFail();
        $albums = Album::with(['styles', 'artists', 'label', 'relationships'])
                        ->select(['albums.*', 'a.artist', 's.style'])
                        ->join('album_artist AS aa', 'albums.id', '=', 'aa.album_id')
                        ->join('artists AS a', function(JoinClause $join){
                            $join->on('aa.artist_id', '=', 'a.id')
                            ->where('aa.ordering', '=', 0);
                        })
                        ->join('album_style AS ast', 'albums.id', '=', 'ast.album_id')
                        ->join('styles AS s', function(JoinClause $join) use ($alias){
                            $join->on('ast.style_id', '=', 's.id')
                                ->whereRaw('s.alias=?', [$alias]);
                        })
                        ->groupBy('aa.album_id')
                        ->orderBy('a.artist', 'asc')
                        ->orderBy('albums.album', 'asc')
                        ->get();
            return view('style', [
                'style' => $style, 
                'albums' => $albums, 
                'songsNumber' => $style->getNumberOfSongs()
            ]);
                
    }

}
