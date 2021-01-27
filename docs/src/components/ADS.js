import React, { useEffect } from "react";
import styled from "styled-components";
import Aos from "aos";
import "aos/dist/aos.css";
import AdsImage from "../img/adsImg.png";

const Container = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
  background: #fff;
  padding-top: 100px;
  margin-bottom: 150px;
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

const LeftComponent = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 725px;

  h1 {
    color: #4263eb;
  }

  p {
    color: #495057;
    font-weight: bold;
  }

  @media screen and (min-width: 768px) and (max-width: 991px) {
    width: 400px;
  }

  @media screen and (max-width: 767px) {
    width: 60%;
  }
`;

const RightComponent = styled.div`
  display: flex;
  justify-content: center;
  width: 600px;
  height: 300px;
  @media screen and (min-width: 768px) and (max-width: 991px) {
    width: 300px;
    img {
      width: 300px;
    }
  }

  @media screen and (max-width: 767px) {
    width: 40%;
    img {
      display: none;
    }
  }
`;

const ADS = () => {
  useEffect(() => {
    Aos.init({ duration: 2000 });
  }, []);

  return (
    <Container>
      <Contents data-aos="zoom-out">
        <LeftComponent>
          <h1>주식 많이 어려우시죠?</h1>
          <p>평소 주식에는 관심이 많지만,</p>
          <p>먼저 어떻게 접근해야 할지 모르는 여러분들을 위해</p>
          <p>
            STOCKER는 매 주 상승할 것으로 예측되는 종목을 분석하는 AI 기반 주식
            추천 서비스를 제공합니다
          </p>
          <h2>이제 STOCKER와 함께하세요!</h2>
        </LeftComponent>
        <RightComponent>
          <img src={AdsImage} />
        </RightComponent>
      </Contents>
    </Container>
  );
};

export default ADS;
