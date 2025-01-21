import { render, screen } from '@testing-library/react';
import App from './App';

test('renders Say Bye to React link', () => {
  render(<App />);
  const linkElement = screen.getByText(/Say Bye to React/i);
  expect(linkElement).toBeInTheDocument();
});
