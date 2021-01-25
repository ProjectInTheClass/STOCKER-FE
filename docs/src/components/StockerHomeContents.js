import React, { useEffect } from "react";
import styled from "styled-components";
import Aos from "aos";
import "aos/dist/aos.css";
import StockerHomeImage from "../img/home.png";

const Container = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
  background: #fff;
  padding-top: 50px;
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

const SplashDesc = styled.div`
  margin-left: 50px;
  width: 350px;
  font-weight: bold;
  color: #495057;
  @media screen and (max-width: 767px) {
    h2 {
      font-size: 1.25em;
    }
    p {
      font-size: 0.875rem;
    }
  }
`;

const Splah = styled.img`
  width: 350px;
  @media screen and (max-width: 767px) {
    width: 150px;
  }
`;

const BackgroundStyles = styled.div`
  width: 100%;
  height: 150px;
  /* background: #4dabf7; */
  position: absolute;
  transform: translate(0, 270%);
  z-index: -1;
`;

const Content = styled.div`
  border-width: 1px;
  width: 150px;
  height: 150px;
  background: #000;
`;

const StockerHomeContents = () => {
  useEffect(() => {
    Aos.init({ duration: 3000 });
  }, []);

  return (
    <Container>
      <BackgroundStyles />
      <Contents data-aos="fade-right">
        {/* <Content />
        <Content />
        <Content /> */}
      </Contents>
    </Container>
  );
};

export default StockerHomeContents;
