# <img src="https://github.com/sem-con/sc-seismic/raw/master/app/assets/images/oyd_blue.png" width="60"> ZAMG Seismic Data    
This [Semantic Container](https://www.ownyourdata.eu/semcon) provides data from seismic activities in Austria and worldwide made available by [ZAMG](https://www.zamg.ac.at).    

Docker Image: https://hub.docker.com/r/semcon/sc-seismic
 

## Usage   
To get a general introduction to the use of Semantic Containers please refer to the [SemCon Tutorial](https://github.com/sem-con/Tutorials).    
Start container locally:    
```
$ docker pull semcon/sc-seismic
$ docker run -d -p 3000:3000 semcon/sc-seismic
```

Access data:    
```
$ curl http://localhost:3000/api/data
```

## Examples    
This section lists examples how to use this Semantic Container.

### Visualize    
Download and run the following Jupyter Notebook to visualize past earthquakes as provided by the Semantic Container:    
[seismic.ipynb](https://github.com/sem-con/sc-seismic/examples)


## Improve this Semantic Container    

Please report any bugs or feature requests in the [GitHub Issue-Tracker](https://github.com/sem-con/sc-seismic/issues) and follow the [Contributor Guidelines](https://github.com/twbs/ratchet/blob/master/CONTRIBUTING.md).

If you want to develop yourself, follow these steps:

1. Fork it!
2. Create a feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Send a pull request

&nbsp;    

## Lizenz

[MIT Lizenz 2019 - OwnYourData.eu](https://raw.githubusercontent.com/sem-con/sc-seismic/master/LICENSE)

