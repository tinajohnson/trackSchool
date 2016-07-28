var Date = React.createClass({
    getInitialState: function() {
        return {};
    },
    handleChange: function(e) {
        console.log(e.target.value);
        this.setState({
            value: e.target.value
        });
    },
    render: function() {
        return (
            <div>
                <input type="date" onChange={this.handleChange}  name="date" id="date" content="date" />
            </div>
        );
    }
});