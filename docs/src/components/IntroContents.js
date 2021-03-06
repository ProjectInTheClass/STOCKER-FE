import React from "react";
import styled from "styled-components";
import mainImg from "../img/stockermain.png";
import logoImg from "../img/stockerLogo.png";
import OpacityBlock from "./ReuseableComponens/OpacityBlock";

const IndexContainer = styled.div`
  width: 100%;
  height: auto;
  display: flex;
  justify-content: center;
`;

const IndexMainView = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100vh;
`;

const MainLogoImg = styled.img`
  display: flex;
  width: 40rem;
  height: 18rem;
  border-width: 1px;
  margin-top: 300px;
  margin-left: 100px;
  @media screen and (max-width: 767px) {
    width: 100%;
    height: 17rem;
    margin-left: 0px;
    /* height: 10rem; */
  }

  @media screen and (max-width: 500px) {
    width: 100%;
    height: 13rem;
    /* height: 10rem; */
  }
`;

const MainBackgroundImg = styled.div`
  width: 100%;
  height: 100vh;
  /* Background Fix code */
  background: url(${(props) => props.img}) no-repeat center/cover;
  background-attachment: fixed;
  z-index: 2828;
`;

const IndexContextContainer = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  /* align-items: center; */
  width: auto;
  height: 480px;

  a {
    z-index: 1818;
    margin-left: 36rem;
  }

  @media screen and (min-width: 768px) and(max-width: 991px) {
    align-items: center;
    margin-left: 0px;

    a {
      width: 100%;
      margin-left: 0rem;
      align-self: center;
    }
  }

  @media screen and (max-width: 767px) {
    a {
      width: 100%;
      align-self: center;
    }
  }
`;

const MoreButton = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  color: red;
  height: 4rem;
  width: 15rem;
  border-radius: 6px;
  left: 50%;
  bottom: 0;
  z-index: 6;
  transform: translate(0%, -50%);
  background-color: white;
  border: 1px solid #dee2e6;
  cursor: pointer;
  z-index: 9999;

  &:hover {
    background-color: #f8f9fa;
  }

  p {
    font-size: 1.25rem;
    color: #495057;
    font-weight: bold;
  }

  @media screen and (min-width: 768px) and(max-width: 991px) {
    transform: translate(0%, 0%);
  }

  @media screen and (max-width: 767px) {
    height: 2.5rem;
    width: 12rem;
    p {
      font-size: 0.875rem;
    }
  }
`;

const IntroContents = () => {
  return (
    <IndexContainer>
      <IndexMainView>
        <MainBackgroundImg img={mainImg}>
          <OpacityBlock height={"100vh"} />
          <IndexContextContainer>
            <MainLogoImg src={logoImg} />
            <a href="https://apps.apple.com/us/app/똑똑한-ai-펀드매니저-stocker/id1550061852">
              <img
                alt="Qries"
                width="150pixel"
                src="https://user-images.githubusercontent.com/46745325/105926994-66b5b280-6086-11eb-8c71-33e6d43eb8c2.png"
              ></img>
            </a>
          </IndexContextContainer>
        </MainBackgroundImg>
        <MoreButton>
          <p>자세히 알아보기</p>
        </MoreButton>
      </IndexMainView>
    </IndexContainer>
  );
};

export default IntroContents;
