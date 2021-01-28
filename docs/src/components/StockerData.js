import React, { useEffect } from "react";
import styled from "styled-components";
import Aos from "aos";
import "aos/dist/aos.css";
import StockerDataImage from "../img/data.png";
import { Player } from "video-react";
import HomeVideo from "../img/datavideo.mp4";
import "../../node_modules/video-react/dist/video-react.css";

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

const PlayerContainer = styled.div`
  width: 300px;
  @media screen and (max-width: 767px) {
    width: 150px;
  }
`;

const StockerData = () => {
  useEffect(() => {
    Aos.init({ duration: 3000 });
  }, []);

  return (
    <Container>
      <BackgroundStyles />
      <Contents data-aos="fade-right">
        <SplashDesc>
          <h2>STOCKER HISTORY</h2>
          <p>- 지난 주차의 히스토리 기록</p>
          <p>- STOCKER AI 정확도를 한눈에 확인</p>
        </SplashDesc>
        <PlayerContainer>
          <Player playsInline src={HomeVideo} fluid={false} width={300} />
        </PlayerContainer>
      </Contents>
    </Container>
  );
};

export default StockerData;
