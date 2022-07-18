
import UIKit

extension FeatureViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.PopularCollectionView{
            return popularMovies.count
        } else if collectionView == self.nowPlayingCollectionview {
            return nowPlayingMovies.count
            
        } else {
            return 0
        }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = PopularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier , for: indexPath) as? PopularCollectionViewCell
        
        let movie = popularMovies[indexPath.item]
        Task{
            let imageData = await Movie.downloadImageDate(withPath: movie.backdropPath)
            let imagem:UIImage = UIImage(data: imageData)
            ?? UIImage()
            cell?.setup(title: movie.title, image: imagem)
            
        }
        
        
        //      cell?.setup(title: movie.title, image: UIImage (named: movie.backdropPath) ?? UIImage())
        //    cell?.imageView.image = UIImage(named: popularMovies [indexPath.item].backdropPath)
        
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) ->
    NowPlayingCollectionViewCell {
        let cell = nowPlayingCollectionview.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as?
        NowPlayingCollectionViewCell
        
        cell?.titlelabel.text = nowPlayingMovies[indexPath.item].title
        let year: String = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
        cell?.datelabel.text = year
        cell?.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].posterPath)
        
        return cell ?? NowPlayingCollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.PopularCollectionView{
            return makePopularCell(indexPath)
        } else if collectionView == self.nowPlayingCollectionview {
            return makeNowPlayingCell(indexPath)
            
            
        } else{
            return UICollectionViewCell()
            
            
        }
    }
}
