
class Collect extends React.Component {

    constructor(props) {
        super(props);

        this.state = {

        }
        
    };
    

    render() {
        return (
                <b>
                    <a className="collection-item">{this.props.name}
                        <span className="badge">{this.props.days}
                        </span></a>
                </b>
             );
    }
}