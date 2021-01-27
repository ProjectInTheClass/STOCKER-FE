import React from "react";
import styled from "styled-components";
import brandLogo from "../img/stockerLogo.png";
import GhAppIntro from "../img/ghAppIntro.png";

const Container = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
`;

const Contents = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 1325px;

  @media screen and (min-width: 768px) and (max-width: 991px) {
    width: 700px;
  }

  @media screen and (max-width: 767px) {
    width: 90%;
  }
`;

const BrandLogo = styled.img`
  display: flex;
  width: 60rem;
  height: 25rem;
  transition: 0.3s ease-in;
  @media screen and (max-width: 767px) {
    width: 100%;
    height: 20rem;
  }

  @media screen and (max-width: 600px) {
    width: 100%;
    height: 15rem;
  }
  @media screen and (max-width: 300px) {
    width: 100%;
    height: 8rem;
  }
`;

const Second = () => {
  return (
    <Container>
      <Contents>
        <BrandLogo src={GhAppIntro} />
      </Contents>
    </Container>
  );
};

export default Second;
