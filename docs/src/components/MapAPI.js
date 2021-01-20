/*global kakao*/
import React, { Component } from "react";
import styled from "styled-components";

const MapAPIContainer = styled.div`
  h1 {
    color: white;
    margin-bottom: 0.5rem;
  }
`;

const MapContents = styled.div`
  width: 500px;
  height: 300px;

  @media screen and (max-width: 767px) {
    width: 290px;
    height: 200px;
  }
`;

class MapAPI extends Component {
  componentDidMount() {
    const script = document.createElement("script");
    script.async = true;
    script.src =
      "https://dapi.kakao.com/v2/maps/sdk.js?appkey=85fdc2c919d4f19cda2e182dbc08c6ba&autoload=false";
    document.head.appendChild(script);

    script.onload = () => {
      kakao.maps.load(() => {
        let container = document.getElementById("Mymap");
        let locate = new kakao.maps.LatLng(37.5607, 126.993479);
        let options = {
          center: locate,
          level: 3,
        };

        const map = new window.kakao.maps.Map(container, options);
        var marker = new kakao.maps.Marker({
          position: locate,
        });

        var infowindow = new kakao.maps.InfoWindow({
          position: locate,
          content: "우리 사무실 없어요",
        });
        infowindow.open(map, marker);
        marker.setMap(map);
      });
    };
  }

  render() {
    return (
      <MapAPIContainer>
        <h1>OFFICE</h1>
        <MapContents id="Mymap" style={{ color: "black" }}></MapContents>
      </MapAPIContainer>
    );
  }
}

export default MapAPI;
