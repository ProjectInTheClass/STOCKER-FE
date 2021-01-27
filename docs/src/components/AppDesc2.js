import React, { useEffect } from "react";
import styled from "styled-components";
import Aos from "aos";
import "aos/dist/aos.css";
import GuideImage1 from "../img/guide3.png";
import GuideImage2 from "../img/guide4.png";

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

const AppDesc2 = () => {
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
            <h3>지난 4주 간의 STOCKER 히스토리를 보여드립니다</h3>
          </DescComponent>
        </DescContainer>
        <DescContainer>
          <DescComponent>
            <DescImageContainer>
              <img src={GuideImage2} />
            </DescImageContainer>
            <h3>각 주차의 수익률을 보여드립니다</h3>
          </DescComponent>
        </DescContainer>
      </Contents>
    </Container>
  );
};

export default AppDesc2;
