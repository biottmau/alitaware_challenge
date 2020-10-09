import React from 'react';
import BeenhereIcon from '@material-ui/icons/Beenhere';


function Marker(props){
    return (
        <div style={{ width: 150 }} className="valign center">
            <BeenhereIcon color={"error"} fontSize={"large"} />
            <div className="card blue darken-1">
                <div className="card-content white-text">
                    <h6>{props.dataProvincia}</h6>
                </div>
            </div>
        </div>
    );

}

export default Marker;