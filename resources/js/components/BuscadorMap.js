/**
 * Componente que concentra el buscador de usuarios y el mapa de google
 */
import React, { useEffect, useState } from 'react';
import ReactDOM from 'react-dom';

import GoogleMapReact from 'google-map-react';
import Marker from './Marker';
import BuscadorUser from './BuscadorUser';


function BuscadorMap(props) {

    const [value, setValue] = useState("");
    const [centerCoords, setCenterMap] = useState({ lat: -34.5813603, lng: -58.4093113 });
    const [dataApiGeo, setDataApiGeo] = useState([]);
    const [dataProvincia, setProvincia] = useState("Buscando...");


    const handleApiLoaded = (map, maps) => {
        // use map and maps objects
    };

    useEffect(() => {
        if(value == ""){
            setDataApiGeo([]);
        }
    },[value]);


    // Funcion de busqueda de provincia para mostrar en pantalla
    const findProvinciaByCoord = (lat, lon) => {
        setProvincia("Obteniendo datos...");
        (async () => {
            const response = await fetch('/api/provncia/' + lat + "/" + lon);
            const ubicacion = await response.json();
            if (ubicacion != undefined && ubicacion.status) {
                setProvincia(ubicacion.ubicacion.provincia.nombre);
            } else {
                setProvincia("No se pudo obtener");
            }
        })();
    }

    // Click del botón Localizar 
    const onClickLocalize = () => {
        // Busco las coordenadas.
        let aValues = value.split("Coords");
        if (aValues.length == 2) {
            let sCorrds = aValues[1];
            sCorrds = sCorrds.replace("(", "").replace(")", "");
            let aCoords = sCorrds.split(",");
            if (!isNaN(parseFloat(aCoords[0])) && !isNaN(parseFloat(aCoords[1]))) {
                setDataApiGeo([{
                    Latitude: aCoords[0],
                    Longitude: aCoords[1]
                }]);

                setCenterMap({
                    lat: parseFloat(aCoords[0]),
                    lng: parseFloat(aCoords[1])
                });
            }

            findProvinciaByCoord(aCoords[0], aCoords[1]);
        }
    }


    return (
        <div className="row">
            <div className="col s12 m12">
                <div className="card  darken-1">
                    <div className="card-content ">
                        <div className="row">
                            <div className="input-field col s8">
                                <BuscadorUser onSelect={ (v) => setValue(v) }/>
                            </div>
                            <div className="input-field col s4 center">
                                <h6>{value}</h6>
                                <button className="btn waves-effect waves-light"
                                    type="button" name="action"
                                    onClick={() => onClickLocalize()}
                                    disabled={value == "" || value == null}
                                >Localizar </button>
                            </div>
                        </div>
                        <div className="row" >
                            <div className="col s12">
                                <div style={{ height: '60vh', width: '100%' }}>
                                    <GoogleMapReact
                                        bootstrapURLKeys={{ key: props.gpk }}
                                        defaultCenter={{ lat: -34.5813603, lng: -58.4093113 }}
                                        center={centerCoords}
                                        defaultZoom={16}
                                        yesIWantToUseGoogleMapApiInternals
                                        onGoogleApiLoaded={({ map, maps }) => handleApiLoaded(map, maps)}
                                    >
                                        {dataApiGeo.map((item, index) => {
                                            return (<Marker lat={item.Latitude} lng={item.Longitude} key={index} dataProvincia={dataProvincia} />);
                                        })}

                                    </GoogleMapReact>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default BuscadorMap;

if (document.getElementById('buscadormap')) {
    let element = document.getElementById('buscadormap');
    let gpk = element.getAttribute("gpk");
    ReactDOM.render(<BuscadorMap gpk={gpk} />, document.getElementById('buscadormap'));
}
