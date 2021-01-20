import React from "react";
import styled from "styled-components";

const OpacityBlockStyles = styled.div`
  width: 100%;
  height: ${(props) => props.height};
  background-color: rgba(255, 255, 255, 0.3);
  z-index: 5;
  position: absolute;
`;

const OpacityBlock = ({ height }) => {
  return <OpacityBlockStyles height={height} />;
};

export default OpacityBlock;
