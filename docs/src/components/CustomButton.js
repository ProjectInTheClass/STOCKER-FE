import React from "react";
import styled, { css } from "styled-components";
import { darken, lighten } from "polished";

const colorStyled = css;

const Button = styled.button`
  height: 2.25rem;
  display: inline-flex;
  cursor: pointer;
  border-radius: 4px;
  font-weight: bold;
  color: white;
  padding: 0 1rem;
  font-size: 1rem;
  outline: none;
  border: white;

  /* Color  */

  ${({ color, theme }) => {
    const selected = theme.palette[color];
    return css`
      background: ${selected};
      &:hover {
        background: ${lighten(0.15, selected)};
      }
      &:active {
        background: ${darken(0.15, selected)};
      }
    `;
  }}
`;

const CustomButton = ({ children, color, ...rest }) => {
  return (
    <Button color={color} {...rest}>
      {children}
    </Button>
  );
};

Button.defaultProps = {
  color: "teal2",
};

export default CustomButton;
