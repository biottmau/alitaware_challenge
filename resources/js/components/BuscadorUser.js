/**
 * Componente encargado de buscar a traves de la API los usuarios del sistema
 * Deuelve el texto seleccionado
 */
import React, { Fragment, useState, useEffect } from 'react';
import TextField from '@material-ui/core/TextField';
import Autocomplete from '@material-ui/lab/Autocomplete';
import CircularProgress from '@material-ui/core/CircularProgress';


function BuscadorUser(props) {
    const [options, setOptions] = useState([]);
    const [inputValue, setInputValue] = useState('');
    const [searching, setSearching] = useState(false);


    // Buscador de socios
    useEffect(() => {
        let active = true;
        if (inputValue == "" || inputValue == null) {
            setOptions([]);
            setSearching(false);
            // setDataApiGeo([]);
            return undefined;
        }
        setSearching(true);
        (async () => {
            const response = await fetch('/api/users/search/' + inputValue);
            const countries = await response.json();

            if (active) {
                setOptions(Object.keys(countries).map((key) => countries[key]));
                setSearching(false);

            }
        })();
        return () => {
            active = false;
        };

    }, [inputValue]);



    return (
        <Autocomplete
            onChange={(event, newValue) => {
                console.log(newValue);
                if (newValue === null || newValue === undefined)
                    props.onSelect("");
                else props.onSelect(newValue.username + " | " + newValue.email + " | " + newValue.name + "  - Coords( " + newValue.latitude + ", " + newValue.longitud + " ) ");
            }}
            inputValue={inputValue}
            onInputChange={(event, newInputValue) => {
                setInputValue(newInputValue);
            }}
            id="controllable-states-demo"
            options={options}
            style={{ width: "100%" }}
            getOptionLabel={(option) => option.username + " | " + option.email + " | " + option.name}

            renderInput={(params) => <TextField
                {...params}
                label="Buscar suscriptor"
                variant="outlined"
                InputProps={{
                    ...params.InputProps,
                    endAdornment: (
                        <Fragment>
                            {searching ? <CircularProgress color="inherit" size={20} /> : null}
                            {params.InputProps.endAdornment}
                        </Fragment>
                    ),
                }}
            />}
        />
    );

}

export default BuscadorUser;