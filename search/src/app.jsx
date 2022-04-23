import { h, Fragment, render } from 'preact';
import Input from './components/input';

function Layout() {
  return (
    <div class=''>
      <Input />
    </div>
  );
}

render(<Layout />, document.body);
