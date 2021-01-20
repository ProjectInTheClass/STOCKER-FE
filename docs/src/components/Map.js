import React from "react";
import MapAPI from "./MapAPI";
import styled from "styled-components";

const MapContainer = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
`;

const ContactContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 500px;
`;

const ContactForm = styled.form`
  display: flex;
  width: 350px;
  height: 268px;
  background: white;
  padding: 1rem;
  border-radius: 6px;

  @media screen and (min-width: 768px) and (max-width: 991px) {
  }
`;

const CustomInput = styled.input`
  width: 150px;
  height: 30px;
  outline: none;
  border: 2px solid #63e6be;
  border-radius: 4px;
  font-size: 1.25rem;
  padding-left: 1rem;
`;

const Map = () => {
  return (
    <MapContainer>
      <MapAPI />
      <ContactContainer>
        <ContactForm>
          <CustomInput type="text" placeholder="Name" />
          <CustomInput type="text" placeholder="Email" />
        </ContactForm>
      </ContactContainer>
    </MapContainer>
  );
};

export default Map;
