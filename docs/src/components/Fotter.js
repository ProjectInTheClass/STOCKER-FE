import React from "react";
import styled, { css } from "styled-components";
import MapAPI from "./MapAPI";
import { lighten, darken } from "polished";

const FotterContainer = styled.div`
  justify-content: center;
  align-items: center;
  width: 100%;
  height: auto;
  background: #495057;
`;

const APIsContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  /* transform: translate(, 0); */
  @media screen and (max-width: 991px) {
    flex-direction: column;
  }
`;

const ContactContainer = styled.div`
  margin-left: 3rem;
  width: 500px;
  h1 {
    color: white;
    margin-bottom: 0.5rem;
  }
  @media screen and (max-width: 991px) {
    margin-left: 0rem;
    width: 300px;
  }
`;

const ContactForm = styled.form`
  display: flex;
  flex-direction: column;
  width: 500px;
  height: 200px;
  padding: 1rem;
  background: white;
  border-radius: 6px;
  @media screen and (max-width: 991px) {
    width: 260px;
  }
`;

const CustomInput = styled.input`
  outline: none;
  color: #343a40;
  border: 2px solid #63e6be;
  border-radius: 4px;
  padding: 0.125rem 1rem;
  font-size: 1rem;
  height: ${(props) => (props.isSmall === true ? "30px" : "120px")};
  & + & {
    margin-top: 0.5rem;
  }
`;

const CustomButton = styled.button`
  width: 100%;
  grid-column: 1/3;
  height: 40px;
  outline: none;
  border: none;
  margin-top: 0.5rem;
  border-radius: 4px;
  background: #63e6be;
  font-size: 1.25rem;
  padding-left: 1rem;
  color: #343a40;
  grid-row-start: 4;
  color: white;
  &:hover {
    background: ${lighten(0.1, "#63e6be")};
  }
  &:active {
    background: ${darken(0.1, "#63e6be")};
  }
`;

const FotterScript = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
`;

const Fotter = () => {
  return (
    <FotterContainer>
      {/* <APIsContainer>
        <MapAPI />
        <ContactContainer>
          <h1>Contact</h1>
          <ContactForm>
            <CustomInput type="text" placeholder="Name" isSmall={true} />
            <CustomInput type="email" placeholder="Email" isSmall={true} />
            <CustomInput type="text" placeholder="Text" isSmall={false} />
            <CustomButton>SEND</CustomButton>
          </ContactForm>
        </ContactContainer>
      </APIsContainer> */}
      <FotterScript>
        <p>서울특별서 중구 퇴계로 2가 충무로영상센터 본관 912호</p>
        <br />
        <p>© 2020 by every sports.</p>
      </FotterScript>
    </FotterContainer>
  );
};

export default Fotter;
