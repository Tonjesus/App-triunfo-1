
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
        
        let movie = nowPlayingMovies[indexPath.item]
        Task{
            let imageData = await Movie.downloadImageDate(withPath: movie.posterPath)
            let imagem:UIImage = UIImage(data: imageData)
            ?? UIImage()
            cell?.setup(title: movie.title, year: year, image: imagem)
        
            
        }
            
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
        
        func makeUpcomingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
            
            let year: String = "\(upcomingMovies[indexPath.item].releaseDate.prefix(4))"
            
            cell?.setup(title: upcomingMovies[indexPath.item].title,
                        year: year,
                        image: UIImage(named: upcomingMovies[indexPath.item].posterPath) ?? UIImage())
          
            let movie = upcomingMovies[indexPath.item]
            Task{
                
                let imageData = await Movie.downloadImageDate(withPath: movie.posterPath)
                let imagem: UIImage = UIImage(data: imageData) ?? UIImage()
                cell?.setup(title: movie.title, year: year, image: imagem)
            }
            return cell ?? UpcomingCollectionViewCell()
            
        }
    }
    
}

