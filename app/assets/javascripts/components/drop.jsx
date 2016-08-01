class Dropdown extends React.Component {

    constructor(props) {
        super(props);

        this.state = {
            data : 0,
            flag : false,
            bool : "No clicks yet.",
            val  : "Enter roll_no"
        }

        this.setNewNumber = this.setNewNumber.bind(this)
    };

    setNewNumber(event) {
        this.setState({val : event.target.value})

    }

    render() {
        return (
                <option value={this.props.name}> {this.props.name} </option> 
                );
    }
}