import React, { useEffect } from "react";
import styled from "styled-components";
import Aos from "aos";
import "aos/dist/aos.css";
import GuideImage1 from "../img/guide1.png";
import GuideImage2 from "../img/guide2.png";

const Container = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
  background: #fff;
  padding-top: 100px;
  margin-bottom: 100px;
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
    width: 100%;
  }
`;

const DescContainer = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 50%;
  height: 300px;

  h3 {
    color: #4263eb;
    padding-left: 3rem;
    padding-right: 3rem;
  }

  p {
    color: #495057;
    font-weight: bold;
  }
`;

const DescComponent = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
`;

const DescImageContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;

  width: 300px;
  height: 300px;
  border-radius: 50%;
  border: 2px solid black;
  border-color: #adb5bd;
  margin-bottom: 4rem;

  img {
    width: 300px;
  }

  @media screen and (max-width: 767px) {
    width: 150px;
    height: 150px;

    img {
      width: 150px;
    }
  }
`;

const AppDesc = () => {
  useEffect(() => {
    Aos.init({ duration: 2000 });
  }, []);

  return (
    <Container>
      <Contents data-aos="zoom-out">
        <DescContainer>
          <DescComponent>
            <DescImageContainer>
              <img src={GuideImage1} />
            </DescImageContainer>
            <h3>
              STOCKER 앱 출시 후의 누적 수익률과 지난 주의 수익률을 보여줍니다
            </h3>
          </DescComponent>
        </DescContainer>
        <DescContainer>
          <DescComponent>
            <DescImageContainer>
              <img src={GuideImage2} />
            </DescImageContainer>
            <h3>추천 종목의 실시간 가격과 차트를 통해 가격 변동을 한눈에!</h3>
          </DescComponent>
        </DescContainer>
      </Contents>
    </Container>
  );
};

export default AppDesc;
