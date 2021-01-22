import React from "react";
import styled from "styled-components";
import brandLogo from "../img/StockerLogo.png";

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
  width: 35rem;
  height: 18rem;
  margin-right: 3rem;
  transition: 0.3s ease-in;
  @media screen and (max-width: 767px) {
    display: none;
  }
`;

const BrandDescContainer = styled.div`
  width: 500px;
  h1 {
    margin-top: 0;
    color: #20c997;
  }
  p {
    color: #868e96;
    font-weight: bold;
  }
`;

const Second = () => {
  return (
    <Container>
      <Contents>
        <BrandLogo src={brandLogo} />
        {/* <BrandDescContainer>
          <h1>STOCKER</h1>
          <p>얼렁얼렁 개발해버리장~~~</p>
        </BrandDescContainer> */}
      </Contents>
    </Container>
  );
};

export default Second;
